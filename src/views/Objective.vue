<!-- eslint-disable -->
<template>
  <div class="anamnesis">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->
      <div class="row">
        <div class="col col-md-12">
          <h2 class="my-3 font-weight-bold">Form Objektif Pasien</h2>
        </div>
      </div>
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
      <div class="card my-3">
        <div class="card-header bg-dark">
          <i style="float: left;" class="fa fa-id-card"></i>
        </div>
        <form>
          <div class="form-row my-3 p-4">
            <div class="col-md-4">
              <label for="inputEmail4">Nadi</label>
              <div class="input-group mb-3">
                <input type="text" class="form-control" v-model="anamnesis.nadi">
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">x/min</span>
                </div>  
              </div>
            </div>
            <div class="col-md-4">
              <label for="inputPassword4">Tekanan Darah</label>
              <div class="input-group">
                <input type="text" class="form-control" v-model="anamnesis.tekanan_darah">
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">mmHg</span>
                </div> 
              </div>
            </div>
            <div class="col-md-4">
              <label for="inputEmail4">Suhu Tubuh</label>
              <div class="input-group">
                <input type="text" class="form-control" v-model="anamnesis.suhu_tubuh">
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">°C</span>
                </div> 
              </div>
            </div>
          </div>
          <div class="form-row p-4">
            <div class="col-md-4">
              <label for="inputPassword4">Respirator Rate</label>
              <div class="input-group">
                <input type="text" class="form-control" v-model="anamnesis.respirator_rate">
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">x/min</span>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <label for="inputEmail4">Berat Badan</label>
              <div class="input-group">
                <input type="text" class="form-control" v-model="anamnesis.berat_badan">
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">kg</span>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <label for="inputPassword4">Tinggi Badan</label>
              <div class="input-group">
                <input type="text" class="form-control" v-model="anamnesis.tinggi_badan">
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">cm</span>
                </div>
              </div>
            </div>
          </div>
          <div class="form-row p-4">
            <div class="form-group col-md-12">
              <label for="exampleFormControlTextarea1">Hasil Pemeriksaan</label>
              <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="anamnesis.hasil_pemeriksaan"></textarea>
            </div>
          </div>

            <div class="row">
              <div class="col">
              </div>
              <div class="col col-lg-3">
              </div>
              <div class="col col-lg-1">
                <button type="reset" class="btn btn-secondary float-right">Reset</button>
              </div>
              <div class="col col-lg-2">
                <button type="button" data-toggle="modal" data-target="#proses_assesment" @click="tambahObjektif()" class="btn btn-success btn-block float-right">simpan</button>
              </div>
            </div>
          </form>
      </div>
      <!-- Modal proses selanjutnya -->
      <div class="modal fade" id="proses_assesment" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Simpan dan lanjut ke proses assesment</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body text-dark">
              Yakin nih mau proses selanjutnya ke assesment ?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="button" class="btn btn-info" @click="prosesAssesment()"
                data-dismiss="modal">Oke</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
/*eslint-disable*/
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
import axios from 'axios'

export default {
  name: 'anamnesis',
  components: {
    SidebarNav
  },
  data () {
    return {
      anamnesis: {
        nadi : '',
        tekanan_darah : '',
        suhu_tubuh : '',
        respirator_rate : '',
        berat_badan : '',
        tinggi_badan : '',
        hasil_pemeriksaan : ''
      },
      rekmed_objektif : [],
      pasien_rekmed : []
    }
  },
  async created() {
    const pasienRekmed = (x) => {
      let y = localStorage.getItem(x);
      return JSON.parse(y) || [];
    }
    this.pasien_rekmed = pasienRekmed('pasien');
    //console.log('pasienobje', this.pasien_rekmed)
  },
  methods: {
    async tambahObjektif() {
      let temp_rekmed_objektif = {
        //'id_pasien' : this.pasien_rekmed.ID,
        'nadi' : this.anamnesis.nadi,
        'tekanan_darah' : this.anamnesis.tekanan_darah,
        'suhu_tubuh' : this.anamnesis.suhu_tubuh,
        'respirator_rate' : this.anamnesis.respirator_rate,
        'berat_badan' : this.anamnesis.berat_badan,
        'tinggi_badan' : this.anamnesis.tinggi_badan,
        'hasil_pemeriksaan' : this.anamnesis.hasil_pemeriksaan
      };
      let objektif = [...this.rekmed_objektif];

      objektif.push(temp_rekmed_objektif);

      //this.$router.push('/assesment')

      this.$store.dispatch('tambahDataObjective', objektif);
      localStorage.setItem('objektive', JSON.stringify(objektif));

      this.rekmed_objektif = [...objektif];
      console.log('data rekmed objektif', this.rekmed_objektif)
    },
    async loadPasien(id = null) {
        if (id) {
          return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get/' + id).then(res => res.data)
        } else {
          return await axios.get('http://localhost/rekmed-server/api/v1/Registrasi/get').then(res => res.data)
        }
    },
    async prosesAssesment() {
        let pasien = await this.loadPasien(this.pasien_rekmed.ID)
        if (pasien) {
          this.$store.dispatch('simpanDataPasien', pasien)
          localStorage.setItem('pasien', JSON.stringify(pasien));
          this.$router.push('/assesment')
        }
      }
  }
}

</script>

<style scoped>
#subjektif-page {
    overflow-y: scroll;
    height: 400px;
  }

  .card {
    border: 1px solid #eeeeee;
  }

  .card-body {
    padding: 6px 12px;
  }
</style>
