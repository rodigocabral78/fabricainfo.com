<?php

namespace App\Modules\Api\Student\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Modules\Api\Student\Services\StudentService;

class StudentController extends Controller
{
	private $studentService;

	function __construct(StudentService $studentService ) {
		$this->studentService = $studentService;
	}

	public function index(Request $request)
	{
		$data =  $this->studentService->index($request);
		return response()->json($data, 200);
	}

	public function show($id)
	{
		$data = $this->studentService->show($id);
		return response()->json($data, 200);
	}

	public function store(Request $request)
	{
		$data = $this->studentService->store($request);
		return response()->json($data, 201);
	}

	public function update(Request $request, $id)
	{
		$data = $this->studentService->update($request, $id);
		return response()->json($data, 200);
	}

	public function destroy($id)
	{
		$data = $this->studentService->destroy($id);
		# return response()->json($data, 200);
		return response()->json($data, 204);
	}
}