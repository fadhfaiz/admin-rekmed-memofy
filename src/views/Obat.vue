<!-- eslint-disable -->
<template>
  <div class="obat">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">
      <!-- Infodata -->
      <!-- <InfoData /> -->
     <!--  <h3>ID Pasien : {{ pasien_rekmed.ID }}  </h3>
      <h3>Nama Pasien : {{ pasien_rekmed.nama}}</h3>
      <br> -->
      <h2 class="my-3 font-weight-bold">Form Resep Dokter</h2>
      <div class="row">
          <div class="col-4">
            <router-link to="/riwayat_medis">
              <div class="card border-left-danger shadow-none">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="text-md font-weight-bold text-danger text-uppercase">{{ pasien_rekmed.nama }}</div>
                  </div>
                </div>
              </div>
            </router-link>
          </div>

          <div class="col-2">
            <router-link to="/riwayat_medis">
              <div class="card border-left-danger shadow-none">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="text-md font-weight-bold text-danger text-uppercase">{{ pasien_rekmed.ID }}</div>
                  </div>
                </div>
              </div>
            </router-link>
          </div>
      </div>
      <div class="card">
          <div class="card-body plan-card-kotak">
            <div class="row">
              <div class="col-md-12 mb-3">
                <div class="card-header font-weight-bold bg-dark text-white">
                  Obat
                </div>
                <div class="obat_scroll">
                  <div class="row my-3 mx-2" v-for="(resep, index) in obat" v-bind:key="index">
                    <div class="col-4">
                      <input type="text" class="form-control" v-model="resep.nama_obat" placeholder="Nama Obat">
                    </div>
                    <div class="col-4">
                      <input type="text" class="form-control" v-model="resep.sigma" placeholder="Sigma">
                    </div>
                    <div class="col-3">
                      <input type="text" class="form-control" v-model="resep.jumlah" placeholder="Jumlah">
                    </div>
                    <div class="col-1">
                      <button type="button" @click="hapusResep(index)" class="btn btn-danger"><i style="float: left;" class="fa fa-times"></i></button>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="mx-auto">
                    <button type="button" @click="tambahResep()" class="btn btn-success">Resep <i class="fa fa-plus-circle"></i></button>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="row my-3 mx-2">
        <router-link to="/racikan"><button type="button" class="btn btn-success">Simpan dan tambah racikan</button></router-link>
      </div>
    </div>

  </div>
</template>
<script>
/*eslint-disable*/
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
//import InfoData from '@/components/InfoData.vue'

export default {
  name: 'obat',
  components: {
    SidebarNav,
  },
  data() {
    return {
      pasien_rekmed : [],
      obat : [{
        nama_obat : '',
        jumlah : '',
        sigma : ''
      }]
    }
  },
  async created() {
    const getData = (x) => {
      let y = localStorage.getItem(x);
      return JSON.parse(y) || [];
    }
    this.pasien_rekmed = getData('pasien');
  },
  methods : {
    tambahResep() {
      this.obat.push({
        nama_obat : '',
        jumlah : '',
        sigma : ''
      })
    },
    hapusResep(index) {
      this.obat.splice(index,1);
    },
  }
}

</script>
<style>
  .obat_scroll {
    overflow-y: scroll;
    height: 200px;
  }

  .plan-card-kotak {
    border-radius: 0px;
  }

  .cari {
    height: 150px;
  }

  a {
    text-decoration: none;
  }

  .card {
    /* border: 0px !important; */
    margin-bottom: 0.5rem !important;
    border-radius: 0.35rem !important;
  }
</style>
