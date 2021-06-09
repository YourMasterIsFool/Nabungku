<template>
  <div class="py-40">
      <input type="file" ref="image" @change="uploadImage">
      <input type="text" v-model="title" class="border-2 border-gray-200 p-6">
      <select v-model="articleCategory">
          <option :value="category.id" :key="category.id" v-for="category in categorys">

              {{category.name}}
          </option>
      </select>
      <textarea name="" v-model="body" id="" cols="30" rows="8" class="border-2 border-gray-200"></textarea>
      <button @click="submitArticle" class=" p-4 bg-blue-200" > add </button>
  </div>
</template>

<script>
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
export default {
    name: "Editor",
    props:['categorys'],
    data() {
        return {
            editor: ClassicEditor,
            body: '',
            articleCategory: null,
            image:'',
            title: '',
            editorConfig:{

            }
        }
    },
    methods: {
        uploadImage() {
            this.image = this.$refs.image.files[0];

            console.log(this.image);
        },
        submitArticle() {
            let formData = new FormData();

            formData.append('image', this.image)
            formData.append('category_id', this.articleCategory);
            formData.append('body', this.body);
            formData.append('title', this.title);

            axios.post('/api/materi_pembelajaran',
                formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                }
            )
            .then((resp) => {
                console.log(resp);
            })
            .catch((err) => {
                console.log(err.response);
            })
        }
    }
}
</script>

<style>
    
</style>