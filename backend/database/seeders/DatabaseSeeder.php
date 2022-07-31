<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\User::factory(10)->create();
        \App\Models\Course::factory(30)->create();
        // \App\Models\Student::factory(10)->create();

        // $this->call([
        //     UserSeeder::class,
        //     CourseSeeder::class,
        //     StudentSeeder::class,
        // ]);
    }
}
