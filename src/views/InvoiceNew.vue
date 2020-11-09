<!-- eslint-disable -->
<template>
  <div class="invoicenew">
    <!-- Sidebar -->
    <SidebarNav />
    <div id="content">
      <table class="table">
        <thead class="table-dark">
          <tr>
            <th scope="col" class="text-center">Nomor Antrian</th>
            <th scope="col" class="text-center">Nama Pasien</th>
            <th scope="col" class="text-center">No Rekam Medis</th>
            <th scope="col" class="text-center">Taaaaksi</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-center">1</td>
            <td>Otto</td>
            <td>RM001</td>
            <td><router-link to="/invoice"><button type="button" class="btn btn-block btn-warning btn-sm">Invoice</button></router-link></td>
          </tr>
          <tr>
            <td class="text-center">2</td>
            <td>Thornton</td>
            <td>RM002</td>
            <td><router-link to="/invoice"><button type="button" class="btn btn-block btn-warning btn-sm">Invoice</button></router-link></td>
          </tr>
          <tr>
            <td class="text-center">3</td>
            <td>the Bird</td>
            <td>RM003</td>
            <td><router-link to="/invoice"><button type="button" class="btn btn-block btn-warning btn-sm">Invoice</button></router-link></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
/*eslint-disable*/
  // @ is an alias to /src
  import SidebarNav from '@/components/SidebarNav.vue'
  import axios from "axios"

  export default {
    name: 'invoicenew',
    components: {
      SidebarNav
    }
  }

</script>
<style>

</style>
