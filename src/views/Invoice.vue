<template>
  <div class="invoice">
    <!-- Sidebar -->
    <SidebarNav />
    <div id="content">
      <p>Aaaa</p>
    </div>
  </div>
</template>

<script>
/*eslint-disable*/
  // @ is an alias to /src
  import SidebarNav from '@/components/SidebarNav.vue'
  export default {
    name: 'invoice',
    components: {
      SidebarNav
    }
  }
</script>

