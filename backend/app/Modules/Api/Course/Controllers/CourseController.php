<?php

namespace App\Modules\Api\Course\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Modules\Api\Course\Services\CourseService;

class CourseController extends Controller
{
	private $courseService;

	function __construct(CourseService $courseService ) {
		$this->courseService = $courseService;
	}

	public function index(Request $request)
	{
		$data =  $this->courseService->index($request);
		return response()->json($data, 200);
	}

	public function show($id)
	{
		$data = $this->courseService->show($id);
		return response()->json($data, 200);
	}

	public function store(Request $request)
	{
		$data = $this->courseService->store($request);
		return response()->json($data, 201);
	}

	public function update(Request $request, $id)
	{
		$data = $this->courseService->update($request, $id);
		return response()->json($data, 200);
	}

	public function destroy($id)
	{
		$data = $this->courseService->destroy($id);
		# return response()->json($data, 200);
		return response()->json($data, 204);
	}
}