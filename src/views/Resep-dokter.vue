<template>
	<div class="resep-dokter">
	<!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">
    <!-- Infodata -->
   	<InfoData />

   	<h2 class="my-3 font-weight-bold">Form Resep Dokter</h2>
    </div>
		
	</div>
</template>
<script>
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
import InfoData from '@/components/InfoData.vue'

export default {
	  name: 'resep-dokter',
	  components: {
	    SidebarNav,
	    InfoData
	  },
  }
</script>