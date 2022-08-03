<?php

namespace App\Modules\Api\Course\Services;

use App\Modules\Api\Course\Models\Course;
use App\Modules\Api\Course\Services\CourseSearchService;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;

class CourseService
{
    public function index(Request $request)
    {
        $courseSearchService = new CourseSearchService();
        #return $courseSearchService->search(Course::with([]), $request);
        $items = Course::query()->get();
        $data = $courseSearchService(Course::with([]), $request)->toArray();
        return [
            'status' => 'success',
            'code' => 200,
            'message' => '',
            'total_count' => $data['total'],
            'limit' => $data['per_page'],
            'offset' => $data['current_page'],
            'current_page' => $data['current_page'],
            'fields' => [
                'id' => 'ID',
                'name' => 'Name',
                'created_at' => 'Created At',
                'updated_at' => 'Updated At',
                'action' => 'Action',
            ],
            'items' => $items,
            'data' => $data['data'],
            'paginate' => [
                'path_url' => $data['path'],
                'first_page' => $data['first_page_url'],
                'prev' => $data['prev_page_url'],
                'prev_page' => $data['prev_page_url'],
                'next' => $data['next_page_url'],
                'next_page' => $data['next_page_url'],
                'last_page' => $data['last_page_url'],
                'from' => $data['from'],
                'to' => $data['to'],
            ],
        ];
    }

    public function show($id)
    {
        # $course = Course::findOrFail($id);
        $course = Course::find($id);

        return $course;
    }

    public function store($request)
    {
        $validator = Validator::make($request->all(), [
            "title" => "required",
            "description" => "nullable",
        ]);

        if ($validator->errors()->count()) {
            throw new \Exception($validator->errors()->first(), 400);
        }

        if (!$validator->errors()->count()) {
            $data = [
                "title" => $request->title,
                "description" => $request->description,
            ];
            return Course::create($data);
        }
    }

    public function update($request, $id)
    {
        # $course = Course::find($id);

        $validator = Validator::make($request->all(), [
            "title" => "required",
            "description" => "nullable",
        ]);

        if ($validator->errors()->count()) {
            throw new \Exception($validator->errors()->first(), 400);
        }

        if (!$validator->errors()->count()) {
            $data = [
                "title" => $request->title,
                "description" => $request->description,
            ];
            $course = Course::find($id)->update($data);
        }
        return $course;
    }

    public function destroy($id)
    {
        $course = Course::find($id)->delete();
        return $course;
    }
}
