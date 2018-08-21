<?php 
    ini_set('max_execution_time',30000);
	class Curl {
        function send($url,$method,$data) {
            //$auth = "3LqgDpiIe0vOAOwjOSr7XbYZm5YdHxoa0QKtIyJEw2w";
            $ch = curl_init($url);

            //a true, obtendremos una respuesta de la url, en otro caso, 
            //true si es correcto, false si no lo es
            
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            //establecemos el verbo http que queremos utilizar para la petici贸n
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);
            //enviamos el array data
            // echo $data;
            curl_setopt($ch, CURLOPT_POSTFIELDS,$data);
            //obtenemos la respuesta
            //curl_setopt($ch, CURLOPT_HTTPHEADER, array("Authorization:$auth"));
            $response = curl_exec($ch);
            
            // Se cierra el recurso CURL y se liberan los recursos del sistema
            curl_close($ch);
            if (!$response) {
                return false;
            }
            else {
                return $response;
            }
        }
    }
?>