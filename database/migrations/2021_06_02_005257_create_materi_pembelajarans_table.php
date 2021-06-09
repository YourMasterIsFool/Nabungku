<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMateriPembelajaransTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('materi_pembelajarans', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('body');
            $table->text('images_url');
            $table->foreignId('category_pembelajaran_id')->references('id')->on('category_materi_pembelajarans')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('materi_pembelajarans');
    }
}
