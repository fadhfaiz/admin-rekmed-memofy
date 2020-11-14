<template>
  <div class="SidebarNav">
    <!-- Sidebar -->
    <nav id="sidebar">
      <div class="container sidebar-header">
        <img src="/new-gojek.png" class="img-fluid w-50 rounded mx-auto d-block">
        <h3 class="mt-3 text-center">{{ nama_klinik }}</h3>
        <p class="text-center text-xs" style="color: white;">{{ tanggal_hari_ini }}</p>
      </div>

      <ul class="list-unstyled components">
        <div class="container text-center text-md">
          <p>{{ nama_dokter }}</p>
        </div>
        <li class="container" v-for="m in menu" :key="m.id">
          <router-link :to="m.path">{{ m.name }} <i style="float: right;" class="fas fa-angle-right mt-1"></i></router-link>
        </li>
        <!-- <li class="container">
          <router-link to="/pendaftaran">Pendaftaran <i style="float: right;" class="fas fa-angle-right mt-1"></i>
          </router-link>
        </li> -->
        <!-- <li class="container">
          <a href="#soapSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Form SOAP</a>
          <ul class="collapse list-unstyled" id="soapSubmenu">
            <li>
              <router-link to="/subjektif">Subjektif</router-link>
            </li>
            <li>
              <router-link to="/objective">Objektif</router-link>
            </li>
            <li>
              <router-link to="/assesment">Assesment</router-link>
            </li>
            <li>
              <router-link to="/plan">Plan</router-link>
            </li>
          </ul>
        </li> -->
        <!-- <li class="container">
          <router-link to="/rekmed">Rekam Medis <i style="float: right;" class="fas fa-angle-right mt-1"></i>
          </router-link>
        </li> -->
        <!-- <li class="container">
          <router-link to="/SOAP">SOAP <i style="float: right;" class="fas fa-angle-right mt-1"></i>
          </router-link>
        </li> -->
        <!-- <li class="container">
          <router-link to="/obat">Obat <i style="float: right;" class="fas fa-angle-right mt-1"></i>
          </router-link>
        </li> -->
        <!-- <li class="container">
          <router-link to="/racikan">Racikan <i style="float: right;" class="fas fa-angle-right mt-1"></i>
          </router-link>
        </li> -->
        <!-- <li class="container">
          <router-link to="/invoice">Invoice <i style="float: right;" class="fas fa-angle-right mt-1"></i>
          </router-link>
        </li> -->
        <hr width="82%" style="background: #D7E0E0;">
        <li class="container">
          <router-link to="/laporan">Laporan <i style="float: right;" class="fas fa-angle-right mt-1"></i></router-link>
        </li>
      </ul>

      <!-- <ul class="list-unstyled CTAs mt-5">
        <li class="container">
          <a href="#" class="download">Download Laporan</a>
        </li>
      </ul> -->

    </nav>
  </div>
</template>

<script>
export default {
  /* eslint-disable */
  name: 'SidebarNav',
  data() {
    return {
      nama_klinik: 'Klinik Tong Fang',
      nama_dokter: 'dr. Azhari, Sp.PA.',
      menu: [
        {id: 1, name: 'Dashboard', path: '/', is_nested: false},
        {id: 2, name: 'Pendaftaran', path: '/pendaftaran', is_nested: false},
        {id: 3, name: 'SOAP', path: '/SOAP', is_nested: false},
        {id: 4, name: 'Obat', path: '/obat', is_nested: false},
        {id: 5, name: 'Racikan', path: '/racikan', is_nested: false},
        {id: 6, name: 'Invoice', path: '/invoice', is_nested: false}
      ]
    }
  },
  computed: {
    tanggal_hari_ini() {
      const D = new Date();

      const kumpulan_hari = [ 'Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu'];
      const kumpulan_bulan = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'Nopember', 'Desember'];

      let hari = kumpulan_hari[D.getDay()];
      let tanggal = D.getDate();
      let bulan = kumpulan_bulan[D.getMonth()];
      let tahun = D.getFullYear();

      return `${hari}, ${tanggal} ${bulan} ${tahun}`;
    }
  }
}

</script>

<style scoped>
  a {
    color: #fff;
  }

  a:hover {
    color: #ffffff !important;
    /* background: #ecf3f3 !important; */
  }

</style>
