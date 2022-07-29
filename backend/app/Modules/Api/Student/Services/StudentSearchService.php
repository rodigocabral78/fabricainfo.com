<?php

namespace App\Modules\Api\Student\Services;

Final class StudentSearchService
{
	# public function search($queryBuilder, $request)
	public function __invoke($queryBuilder, $request)
	{
		if ($request->id) {
			$queryBuilder->where("id", "=", $request->id);
		}

		if ($request->name) {
			$queryBuilder->where("name", "=", $request->name);
		}

		if ($request->email) {
			$queryBuilder->where("email", "=", $request->email);
		}

		if ($request->birthdate) {
			$queryBuilder->where("birthdate", "=", $request->birthdate);
		}

		if ($request->order) {
			$order = ($request->order == "asc") ? "asc" : "desc";
			$queryBuilder->orderBy("id", $order);
		}

		return $queryBuilder->paginate(($request->count) ? $request->count : 10);
	}
}