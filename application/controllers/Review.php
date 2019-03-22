<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Review extends CI_Controller
{
    function __construct()
    {
        parent::__construct();
        $this->load->model('Review_model');
        $this->load->library('form_validation');        
	$this->load->library('datatables');
    }

    public function index()
    {
        $this->load->view('review/review_list');
    } 
    
    public function json() {
        header('Content-Type: application/json');
        echo $this->Review_model->json();
    }

    public function read($id) 
    {
        $row = $this->Review_model->get_by_id($id);
        if ($row) {
            $data = array(
		'id' => $row->id,
		'review' => $row->review,
		'date' => $row->date,
		'spot_id' => $row->spot_id,
		'user_id' => $row->user_id,
	    );
            $this->load->view('review/review_read', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('review'));
        }
    }

    public function create() 
    {
        $data = array(
            'button' => 'Create',
            'action' => site_url('review/create_action'),
	    'id' => set_value('id'),
	    'review' => set_value('review'),
	    'date' => set_value('date'),
	    'spot_id' => set_value('spot_id'),
	    'user_id' => set_value('user_id'),
	);
        $this->load->view('review/review_form', $data);
    }
    
    public function create_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->create();
        } else {
            $data = array(
		'review' => $this->input->post('review',TRUE),
		'date' => $this->input->post('date',TRUE),
		'spot_id' => $this->input->post('spot_id',TRUE),
		'user_id' => $this->input->post('user_id',TRUE),
	    );

            $this->Review_model->insert($data);
            $this->session->set_flashdata('message', 'Create Record Success');
            redirect(site_url('review'));
        }
    }
    
    public function update($id) 
    {
        $row = $this->Review_model->get_by_id($id);

        if ($row) {
            $data = array(
                'button' => 'Update',
                'action' => site_url('review/update_action'),
		'id' => set_value('id', $row->id),
		'review' => set_value('review', $row->review),
		'date' => set_value('date', $row->date),
		'spot_id' => set_value('spot_id', $row->spot_id),
		'user_id' => set_value('user_id', $row->user_id),
	    );
            $this->load->view('review/review_form', $data);
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('review'));
        }
    }
    
    public function update_action() 
    {
        $this->_rules();

        if ($this->form_validation->run() == FALSE) {
            $this->update($this->input->post('id', TRUE));
        } else {
            $data = array(
		'review' => $this->input->post('review',TRUE),
		'date' => $this->input->post('date',TRUE),
		'spot_id' => $this->input->post('spot_id',TRUE),
		'user_id' => $this->input->post('user_id',TRUE),
	    );

            $this->Review_model->update($this->input->post('id', TRUE), $data);
            $this->session->set_flashdata('message', 'Update Record Success');
            redirect(site_url('review'));
        }
    }
    
    public function delete($id) 
    {
        $row = $this->Review_model->get_by_id($id);

        if ($row) {
            $this->Review_model->delete($id);
            $this->session->set_flashdata('message', 'Delete Record Success');
            redirect(site_url('review'));
        } else {
            $this->session->set_flashdata('message', 'Record Not Found');
            redirect(site_url('review'));
        }
    }

    public function _rules() 
    {
	$this->form_validation->set_rules('review', 'review', 'trim|required');
	$this->form_validation->set_rules('date', 'date', 'trim|required');
	$this->form_validation->set_rules('spot_id', 'spot id', 'trim|required');
	$this->form_validation->set_rules('user_id', 'user id', 'trim|required');

	$this->form_validation->set_rules('id', 'id', 'trim');
	$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
    }

}

/* End of file Review.php */
/* Location: ./application/controllers/Review.php */
/* Please DO NOT modify this information : */
/* Generated by Harviacode Codeigniter CRUD Generator 2019-03-22 05:40:36 */
/* http://harviacode.com */