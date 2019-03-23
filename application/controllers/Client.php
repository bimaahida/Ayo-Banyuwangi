<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Client extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Type_spot_model');
        $this->load->model('Spot_model');
        $this->load->model('Review_model');
        $this->load->library('form_validation');        
	    $this->load->library('datatables');
    }

    public function index()
    {
        $returnArray = array();
        $type_spot = $this->Type_spot_model->get_all();
        foreach ($type_spot as $keyType) {
            $tmp = $this->getTopSpotByReview($keyType->id);
            $tmpArray = array(
                'id' => $keyType->id,
                'name' => $keyType->name,
                'title' => $keyType->title,
                'description' => $keyType->description,
                'image' => $keyType->image,
                'listSpot' => $tmp,
            );
            array_push($returnArray,$tmpArray);
        }

        $data = array(
            'type_spot' => $returnArray,
        );
        $this->render['content']= $this->load->view('client_page/home', $data, TRUE);
        $this->load->view('templateClient', $this->render);
    }
    private function getTopSpotByReview($id){
        $dataReturn = array();
        $dateSpot = $this->Spot_model->get_by_type($id);
        foreach ($dateSpot as $keySpot) {
            $totalReting = 0;
            $dataReview = $this->Review_model->get_by_spot($keySpot->id);
            foreach ($dataReview as $keyReview) {
                $totalReting += $keyReview->rating;
            }
            
            if(count($dataReview) > 0){
                $totalReting = $totalReting / count($dataReview);
            }

            $tmp = array(
                'id' => $keySpot->id, 
                'name' => $keySpot->name, 
                'image' => $keySpot->image, 
                'description' => $keySpot->description, 
                'latitude' => $keySpot->latitude, 
                'longitude' => $keySpot->longitude,
                'reting' =>  $totalReting,
            );
            array_push($dataReturn,$tmp);
        }
        
        usort($dataReturn, function($a, $b) {return $b['reting'] <=> $a['reting'];});

        return array_slice($dataReturn,0,4);
    }
    

}

/* End of file Gallery.php */
/* Location: ./application/controllers/Gallery.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2019-03-22 05:40:35 */
/* http://harviacode.com */