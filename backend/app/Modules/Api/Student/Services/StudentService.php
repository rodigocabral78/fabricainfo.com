<?php

namespace App\Modules\Api\Student\Services;

use App\Modules\Api\Student\Models\Student;
use App\Modules\Api\Student\Services\StudentSearchService;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class StudentService
{
	public function index(Request $request)
	{
		$studentSearchService = new StudentSearchService();
		#return $studentSearchService->search(Student::with([]), $request);
		$data = $studentSearchService(Student::with([]), $request)->toArray();
		return [
			'total_count' => $data['total'],
			'limit' => $data['per_page'],
			'data' => $data['data'],
			'paginate' => [
				'path_url' => $data['path'],
				'first_page' => $data['first_page_url'],
				'prev_page' => $data['prev_page_url'],
				'current_page' => $data['current_page'],
				'next_page' => $data['next_page_url'],
				'last_page' => $data['last_page_url'],
				'from' => $data['from'],
				'to' => $data['to'],
			],
		];
	}

	public function show($id)
	{
		# $student = Student::findOrFail($id);
		$student = Student::find($id);

		return $student;
	}

	public function store($request)
	{
		$validator = Validator::make($request->all(), [
			"birthdate" => "required",
			"name" => "required",
			"email" => "required",
		]);

		if($validator->errors()->count()) {
			throw new \Exception($validator->errors()->first(),400);
		}

		if(!$validator->errors()->count()) {
			$data = [
				"name" => $request->name,
				"email" => $request->email,
				"birthdate" => $request->birthdate,
			];
			return Student::create($data);
		}
	}

	public function update($request, $id)
	{
		# $student = Student::find($id);

		$validator = Validator::make($request->all(), [
			"birthdate" => "required",
			"name" => "required",
			"email" => "required",
		]);

		if($validator->errors()->count()) {
			throw new \Exception($validator->errors()->first(),400);
		}

		if(!$validator->errors()->count()) {
			$data = [
				"name" => $request->name,
				"email" => $request->email,
				"birthdate" => $request->birthdate,
			];
			$student = Student::find($id)->update($data);
		}
		return $student;
	}

	public function destroy($id)
	{
		$student = Student::find($id)->delete();
		return $student;
	}
}