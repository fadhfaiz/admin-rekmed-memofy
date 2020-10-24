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
      <div class="row mb-4">
        <div class="col col-md-4">
          <router-link to="/riwayat_medis">
            <div class="card border-left-primary shadow-none">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                  <div class="text-md font-weight-bold text-primary text-uppercase"> NAMA : {{ pasien_rekmed.nama}}</div>
               </div>
             </div>
            </div>
          </router-link>
         </div>
         <div class="col col-md-3">
          <router-link to="/riwayat_medis">
            <div class="card border-left-primary shadow-none">
              <div class="card-body">
                <div class="row no-gutters align-items-center">
                 <div class="text-md font-weight-bold text-primary text-uppercase">ID PASIEN : {{ pasien_rekmed.ID }}</div>
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
              <div>
                <div class="row my-3 mx-2" v-for="(resep, index) in obat" v-bind:key="index">
                  <div class="col-4">
                    <input type="text" class="form-control" v-model="resep.nama_obat" placeholder="Nama Obat">
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" v-model="resep.signa" placeholder="Signa">
                  </div>
                  <div class="col-3">
                    <input type="text" class="form-control" v-model="resep.jumlah" placeholder="Jumlah">
                  </div>
                  <div class="col-1">
                    <button type="button" @click="hapusResep(resep.id_obat, index)" class="btn btn-danger"><i style="float: left;"
                        class="fa fa-times"></i></button>
                  </div>
                </div>
              </div>
              <div class="row my-3 mx-2">
                <div class="col-4">
                    <input type="text" class="form-control" @click="tambahResep()" placeholder="Nama Obat" readonly>
                  </div>
                  <div class="col-4">
                    <input type="text" class="form-control" placeholder="Signa" readonly>
                  </div>
                  <div class="col-3">
                    <input type="text" class="form-control" placeholder="Jumlah" readonly>
                  </div>
                  
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row my-3">
        <div class="col-8"></div>
        <div class="col-4" style="margin-left: 48rem">
          <button type="button" @click="simpanObat()" class="btn btn-info">Simpan dan tambah racikan</button>
        </div>
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
          id_obat : Math.random(),
          nama_obat : '',
          jumlah : '',
          signa : ''
        }],
        tampil_obat : [],
        subjektif : [] 
      }
    },
    async created() {
      const getData = (x) => {
        let y = localStorage.getItem(x);
        return JSON.parse(y) || [];
      }
      this.pasien_rekmed = getData('pasien');
      //this.subjektif = getData('subjective');

      //console.log(this.subjektif)
    },
    methods: {
      tambahResep() {
        this.obat.push({
          //id_pasien : this.pasien_rekmed.ID,
          id_obat : Math.random(),
          nama_obat : '',
          jumlah : '',
          signa : ''
        })
        this.tampil_obat = [...this.obat];

        this.$store.dispatch('tambahDataObat', this.tampil_obat);
        localStorage.setItem('obat', JSON.stringify(this.tampil_obat));
        console.log('obat',this.tampil_obat)
      },
      hapusResep(id_obat,index) {
        this.obat.id_obat = id_obat
        this.obat.splice(index,1)

        this.tampil_obat = [...this.obat]
        this.$store.dispatch('tambahDataObat', this.tampil_obat);
        localStorage.setItem('obat', JSON.stringify(this.tampil_obat));
        console.log('obat hapus',this.tampil_obat)

      },
      simpanObat() {
        this.$router.push('/racikan')
      }
    }
  }

</script>
<style>
  /* .obat_scroll {
    overflow-y: scroll;
    height: 300px;
  } */

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
