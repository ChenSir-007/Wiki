<template>
  <a-layout-footer style="text-align: center">
    基于Vue3的校园知识库系统<span v-show="user.id">，欢迎：{{user.name}}</span>
  </a-layout-footer>
</template>

<script lang="ts">
import store from '@/store';
import {computed, defineComponent } from 'vue';

export default defineComponent({
  name: 'the-footer',
  setup(){
    const user = computed(() => store.state.user);

    return{
      user
    }
  }
});
</script>