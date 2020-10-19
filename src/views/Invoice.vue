<template>
  <div class="invoice">
    <!-- Sidebar -->
    <SidebarNav />
    <div id="content">
      <div class="row">
        <div class="col-md-6">
          <div>
            <table class="table table-sm table-borderless">
              <tbody>
                <tr>
                  <th>Nama</th>
                  <td>: {{ pasien_rekmed.nama }}</td>
                </tr>
                <tr>
                  <th>Nomor Rekam Medis</th>
                  <td>: {{ pasien_rekmed.ID }}</td>
                </tr>
                <tr>
                  <th>Status BPJS</th>
                  <td>: Tidak</td>
                </tr>
                <tr>
                  <th>Tanggal</th>
                  <td>: {{ pasien_rekmed.created_at }}</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div>
            <div class="card">
              <ul class="list-group">
              <li class="list-group-item font-weight-bold text-center">Subjektif</li>
                <div class="px-5" v-for="(sub, index) in subjektif" v-bind:key="index">
                  <span>{{ index+1 }}. {{ sub.subjective }}</span><br>
                </div>
              <li class="list-group-item font-weight-bold text-center">Objektif</li>
                <div class="px-5 my-2" v-for="(obj, index) in objektif" v-bind:key="index">
                  <span> Nadi : {{ obj.nadi }}</span><br>
                  <span> Tekanan Darah : {{ obj.tekanan_darah }}</span><br>
                  <span> Suhu Tubuh : {{ obj.suhu_tubuh }}</span><br>
                  <span> Respirator Rate : {{ obj.respirator_rate }}</span><br>
                  <span> Berat Badan : {{ obj.berat_badan }}</span><br>
                  <span> Tinggi Badan : {{ obj.tinggi_badan }}</span><br>
                  <span> Hasil Pemeriksaan : {{ obj.hasil_pemeriksaan }}</span>
                </div>
              <li class="list-group-item font-weight-bold text-center">Assesment</li>
                <div class="px-5" v-for="(ass, index) in assesment" v-bind:key="index">
                  <span>{{ index+1 }}. {{ ass.nama_diagnosis }}</span><br>
                </div>
              <li class="list-group-item font-weight-bold text-center">Planning</li>
              <li class="list-group-item">Rencana Diagnostik</li>
                <div class="px-5" v-for="(diag, index) in plan_diagnosis" v-bind:key="index">
                  <span>{{ index+1 }}. {{ diag.nama_diagnosis }}</span><br>
                </div>
              <li class="list-group-item">Rencana Terapi</li>
              <li class="list-group-item">Rencana Edukasi</li>
              <li class="list-group-item font-weight-bold text-center">Resep</li>
              <li class="list-group-item">ALorem Ipsum</li>
              <li class="list-group-item font-weight-bold text-center">Total Pembayaran</li>
              <li class="list-group-item">ALorem Ipsum</li>
            </ul>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div>
            <p class="h4 font-weight-bold text-center">Klink Citra Medika</p><hr>
          </div>
          <div>
            <table class="table table-sm table-borderless">
              <tbody>
                <tr>
                  <th>Nama</th>
                  <td>: {{ pasien_rekmed.nama }}</td>
                </tr>
                <tr>
                  <th>Nomor Rekam Medis</th>
                  <td>: {{ pasien_rekmed.ID }}</td>
                </tr>
              </tbody>
            </table>
            <hr>
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
  export default {
    name: 'invoice',
    components: {
      SidebarNav
    },
    data() {
      return {
        pasien_rekmed : [],
        subjektif : [],
        objektif : [],
        assesment : [],
        plan_diagnosis : [],
        plan_terapi : [],
        plan_edukasi : []
      }
    },
    async created() {
      const getData = (x) => {
        let y = localStorage.getItem(x);
        return JSON.parse(y) || [];
      }
      this.pasien_rekmed = getData('pasien');
      this.subjektif = getData('subjective');
      this.objektif = getData('objektive');
      this.assesment = getData('list_assesment');
      //this.plan_diagnosis = getData('plan_diagnosis');
      //this.plan_terapi = getData('plan_terapi');
      //this.plan_edukasi = getData('plan_edukasi');
      //this.tampil_racikan = getData('racikan');

      console.log('pasien', this.pasien_rekmed)
      console.log('subjektif', this.subjektif)
      console.log('objektif', this.objektif)
      console.log('assesment', this.assesment)
      //console.log('plan_diagnosis', this.plan_diagnosis)
      //console.log('plan_terapi', this.plan_terapi)
      //console.log('plan_edukasi', this.plan_edukasi)
    }
  }
</script>

