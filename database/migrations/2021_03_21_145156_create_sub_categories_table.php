<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      
        Schema::dropIfExists('sub_categories');
        Schema::create('sub_categories', function (Blueprint $table) {
            $table->id();
            $table->string('sub_category_name');
            $table->integer('amount')->nullable(true);
            $table->date('finishBy')->nullable(true);
            $table->string('period')->nullable(true);
            $table->float('budgeted', 16, 2)->default(0);
            $table->timestamps();
            $table->foreignId('category_id')->references('id')->on('master_categories')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sub_categories');
    }
}
