<?php

namespace App\Modules\Api\Course\Services;

Final class CourseSearchService
{
	# public function search($queryBuilder, $request)
	public function __invoke($queryBuilder, $request)
	{
		if ($request->id) {
			$queryBuilder->where("id", "=", $request->id);
		}

		if ($request->title) {
			$queryBuilder->where("title", "=", $request->title);
		}

		if ($request->description) {
			$queryBuilder->where("description", "=", $request->description);
		}

		if ($request->order) {
			$order = ($request->order == "asc") ? "asc" : "desc";
			$queryBuilder->orderBy("id", $order);
		}

		return $queryBuilder->paginate(($request->count) ? $request->count : 10);
	}
}