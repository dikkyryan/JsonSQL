<?php
    header('Content-Type: application/json; charset-utf8');
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type, Content-Range, Content-Disposition, Content-Description');

 	$db_host = 'localhost';
 	$db_username = 'homestead';
 	$db_password = 'secret';
 	$db_name = 'katalog';

    $mysql_db = new mysqli($db_host, $db_username, $db_password, $db_name);
    if ($mysql_db->connect_error) {
        die("Koneksi ke database gagal . " . $db_connect->connect_error);
    }

    $categories_query = $mysql_db->query("SELECT * FROM categories");
    $products_query = $mysql_db->query("SELECT * FROM products ORDER BY category_id");
    $variants_query = $mysql_db->query("SELECT * FROM variants ORDER BY product_id");

    $category_array = [];
    $product_array = [];
    $variant_array = [];


    if ($categories_query) {
        $category_array = [];
        $idx_category = 0;

        while ($category_object = $categories_query->fetch_object()) {
            $category_array[$idx_category]['id'] = $category_object->id;
            $category_array[$idx_category]['name'] = $category_object->nama;
            $idx_category++;
        }
    }


    if ($products_query) {
        $idx_product = 0;

        while ($product_object = $products_query->fetch_object()) {
            $product_array[$idx_product]['id'] = $product_object->id;
            $product_array[$idx_product]['category_id'] = $product_object->category_id;
            $product_array[$idx_product]['nama'] = $product_object->nama_produk;
            $product_array[$idx_product]['deskripsi'] = $product_object->deskripsi;
            $product_array[$idx_product]['berat'] = $product_object->berat;
            $product_array[$idx_product]['harga'] = $product_object->harga;
            $product_array[$idx_product]['stock'] = $product_object->stock;
            $idx_product++;
        }
    }


    if ($variants_query) {
        $idx_variant = 0;

        while ($variant = $variants_query->fetch_object()) {
            $variant_array[$idx_variant]['id'] = $variant->id;
            $variant_array[$idx_variant]['product_id'] = $variant->product_id;
            $variant_array[$idx_variant]['nama_varian'] = $variant->nama_varian;
            $variant_array[$idx_variant]['harga'] = $variant->harga;
            $variant_array[$idx_variant]['stock'] = $variant->stock;
            $idx_variant++;
        }
    }


    // print_r($variant_array); exit();


    if (!empty($category_array)) {
        $category_length = count($category_array);
        $product_length = count($product_array);
        $variant_length = count($variant_array);

        $category_json = [];
        $i = 0;
        $j = 0;
        $k = 0;
        $l = 0;
        $m = 0;
        while ($i < $category_length) {
            $j = 0;
            $k = 0;
            $category_id = $category_array[$i]['id'];
            $category_json[$i]['id'] = $category_id;
            $category_json[$i]['nama'] = $category_array[$i]['name'];
            $category_json[$i]['data_produk'] = [];

            // product
            while ($j < $product_length) {
                $l = 0;
                $m = 0;
                $product_category_id = $product_array[$j]['category_id'];
                $product_id = $product_array[$j]['id'];

                $product_json = [];
                if ($category_id == $product_category_id) {
                    $product_json['id'] = $product_id;
                    $product_json['nama'] = $product_array[$j]['nama'];
                    $product_json['deskripsi'] = $product_array[$j]['deskripsi'];
                    $product_json['berat'] = $product_array[$j]['berat'];
                    $product_json['harga'] = $product_array[$j]['harga'];
                    $product_json['stock'] = $product_array[$j]['stock'];
                    $product_json['data_varian'] = [];

                    // variant
                    while ($l < $variant_length) {
                        $variant_product_id = $variant_array[$l]['product_id'];

                        $variant_json = [];
                        if ($product_id == $variant_product_id) {
                            $variant_json['id'] = $variant_array[$l]['id'];
                            $variant_json['product_id'] = $variant_array[$l]['product_id'];
                            $variant_json['nama_varian'] = $variant_array[$l]['nama_varian'];
                            $variant_json['stock'] = $variant_array[$l]['stock'];
                            $variant_json['harga'] = $variant_array[$l]['harga'];

                            $product_json['data_varian'][] = $variant_json;

                            $m++;
                        }

                        $l++;
                    }


                    $category_json[$i]['data_produk'][$k] = $product_json;
                    $k++;
                }

                $j++;
            }

            $i++;
        }


        echo json_encode([
            'message' => 'Sukses',
            'data_kategori' => $category_json
        ]);

    }
    else {
        echo json_encode([
            'message' => 'Tidak ada data',
            'data_kategori' => []
        ]);

    }
 ?>
