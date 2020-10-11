<!-- eslint-disable -->
<template>
  <div class="anamnesis">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->

      <h2 class="my-3 font-weight-bold">Form Anamnesis Pasien</h2>
      <form>
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
        <div class="form-row">
          <div class="form-group col-md-12">
            <label for="exampleFormControlTextarea1">Hasil Pemeriksaan</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model="anamnesis.hasil_pemeriksaan"></textarea>
          </div>
        </div>

          <div class="row">
            <div class="col">
              <div class="card border-left-danger shadow-none">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="text-md font-weight-bold text-danger text-uppercase">{{ pasien_rekmed.nama }}</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col col-lg-3">
              <div class="card border-left-danger shadow-none">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="text-md font-weight-bold text-danger text-uppercase">{{ pasien_rekmed.ID }}</div>
                  </div>
                </div>
              </div>
            </div>

            <div class="col col-lg-1">
              <button type="reset" class="btn btn-warning float-right">Reset</button>
            </div>
            <div class="col col-lg-2">
              <button type="button" @click="tambahObjektif()" class="btn btn-success btn-block float-right">simpan</button>
            </div>
          </div>
          
      </form>
    </div>
  </div>
</template>

<script>
/*eslint-disable*/
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
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
        'id_pasien' : this.pasien_rekmed.ID,
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

      this.$router.push('/assesment')

      this.$store.dispatch('tambahDataObjective', objektif);
      localStorage.setItem('rekmed_objektif', JSON.stringify(objektif));

      this.rekmed_objektif = [...objektif];
      console.log('data rekmed objektif', this.rekmed_objektif)
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
