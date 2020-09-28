<template>
  <div class="anamnesis">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <InfoData />

      <h2 class="my-3 font-weight-bold">Form Anamnesis Pasien</h2>
      <form>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputEmail4">Keluhan</label>
            <input type="text" class="form-control" v-model="anamnesis.keluhan">
          </div>
          <div class="form-group col-md-6">
            <label for="inputPassword4">Riwayat Penyakit</label>
            <input type="text" class="form-control" v-model="anamnesis.riwayat_penyakit">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputEmail4">Nadi</label>
            <input type="text" class="form-control" v-model="anamnesis.nadi">
          </div>
          <div class="form-group col-md-6">
            <label for="inputPassword4">Tekanan Darah</label>
            <input type="text" class="form-control" v-model="anamnesis.tekanan_darah">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputEmail4">Suhu Tubuh</label>
            <input type="text" class="form-control" v-model="anamnesis.suhu_tubuh">
          </div>
          <div class="form-group col-md-6">
            <label for="inputPassword4">Respirator Rate</label>
            <input type="text" class="form-control" v-model="anamnesis.respirator_rate">
          </div>
        </div>
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputEmail4">Berat Badan</label>
            <input type="text" class="form-control" v-model="anamnesis.berat_badan">
          </div>
          <div class="form-group col-md-6">
            <label for="inputPassword4">Tinggi Badan</label>
            <input type="text" class="form-control" v-model="anamnesis.tinggi_badan">
          </div>
        </div>

          <div class="row">
            <div class="col">
              <div class="card border-left-danger shadow-none">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="text-md font-weight-bold text-danger text-uppercase">Insan Carono</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col col-lg-3">
              <div class="card border-left-danger shadow-none">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="text-md font-weight-bold text-danger text-uppercase">201801</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col col-lg-1">
              <button type="reset" class="btn btn-warning float-right">Reset</button>
            </div>
            <div class="col col-lg-2">
              <router-link to="/anamnesis"><button type="submit" class="btn btn-success btn-block float-right">Masuk Antrian</button></router-link>
            </div>
          </div>

      </form>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
import InfoData from '@/components/InfoData.vue'

export default {
  name: 'anamnesis',
  components: {
    SidebarNav,
    InfoData
  },
  data () {
    return {
      anamnesis: {
        keluhan: '',
        riwayat_penyakit: '',
        nadi: '',
        tekanan_darah: '',
        suhu_tubuh: '',
        respirator_rate: '',
        berat_badan: '',
        tinggi_badan: ''
      }
    }
  }
}

</script>

<style scoped>
.card {
  border: 1px solid #eeeeee;
}
.card-body {
  padding: 8px 12px;
}
</style>
