<!-- eslint-disable -->
<template>
  <div class="invoice">
    <!-- Sidebar -->
    <SidebarNav />
    <div id="content">
      <div class="card p-4">
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
              <div class="card p-4">
                <div class="row my-3">
                  <div class="col-1">
                    <span>S</span>
                  </div>
                  <div class="col-1">:</div>
                  <div class="col-10">
                    <div v-for="(sub) in subjektif" v-bind:key="sub.id">
                      <span>{{ sub.nama }}</span><br>
                    </div>
                  </div>
                </div>
                <div class="row my-3">
                  <div class="col-1">
                    <span>O</span>
                  </div>
                  <div class="col-1">:</div>
                  <div class="col-10">
                    <div class="row">
                      <div class="col-5">Nadi</div>
                      <div class="col-1">:</div>
                      <div class="col-6">{{ objektif.nadi }} x/min</div>
                    </div>
                    <div class="row">
                      <div class="col-5">Tekanan Darah</div>
                      <div class="col-1">:</div>
                      <div class="col-6">{{ objektif.tekanan_darah }} mmHg</div>
                    </div>
                    <div class="row">
                      <div class="col-5">Suhu Tubuh</div>
                      <div class="col-1">:</div>
                      <div class="col-6">{{ objektif.suhu_tubuh }} °C</div>
                    </div>
                    <div class="row">
                      <div class="col-5">Respirator Rate</div>
                      <div class="col-1">:</div>
                      <div class="col-6">{{ objektif.respiration_rate }} x/min</div>
                    </div>
                    <div class="row">
                      <div class="col-5">Berat Badan</div>
                      <div class="col-1">:</div>
                      <div class="col-6">{{ objektif.berat_badan }} kg</div>
                    </div>
                    <div class="row">
                      <div class="col-5">Tinggi Badan</div>
                      <div class="col-1">:</div>
                      <div class="col-6">{{ objektif.tinggi_badan }} cm</div>
                    </div>
                    <div class="row">
                      <div class="col-5">Hasil Pemeriksaan</div>
                      <div class="col-1">:</div>
                      <div class="col-6">{{ objektif.hasil_pemeriksaan }}</div>
                    </div>
                  </div>
                </div>
                <div class="row my-3">
                  <div class="col-1">
                    <span>A</span>
                  </div>
                  <div class="col-1">:</div>
                  <div class="col-10">
                    <div v-for="(ass) in assesment" v-bind:key="ass.id">
                      <span>{{ ass.nama_diagnosis }}</span>
                    </div>
                  </div>
                </div>
                <div class="row my-3">
                  <div class="col-1">
                    <span>P</span>
                  </div>
                  <div class="col-1">:</div>
                  <div class="col-10">
                    <div class="row">
                      <div class="col-5">Diagnostik</div>
                      <div class="col-1">:</div>
                      <div class="col-6">
                        <div v-for="plan1 in plan_diagnosis" v-bind:key="plan1.id">
                          <span>{{ plan1.nama }}</span><br>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-5">Terapi</div>
                      <div class="col-1">:</div>
                      <div class="col-6">
                        <div v-for="plan2 in plan_terapi" v-bind:key="plan2.id">
                          <span>{{ plan2.nama }}</span><br>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-5">Edukasi</div>
                      <div class="col-1">:</div>
                      <div class="col-6">
                        <div v-for="plan3 in plan_edukasi" v-bind:key="plan3.id">
                          <span>{{ plan3.nama }}</span><br>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row my-3">
                  <div class="col-1">
                    <span>D</span>
                  </div>
                  <div class="col-1">:</div>
                  <div class="col-10">
                    <div v-for="(diagnosis) in diagnosis" v-bind:key="diagnosis.id">
                      <span>{{ diagnosis.nama }}</span>
                    </div>
                  </div>
                </div>
                <div class="row my-3">
                  <div class="col-1">
                    <span>T</span>
                  </div>
                  <div class="col-1">:</div>
                  <div class="col-10">
                    <div v-for="(tindakan) in tindakan" v-bind:key="tindakan.id">
                      <span>{{ tindakan.nama_tindakan }}</span>
                    </div>
                  </div>
                </div>
                <div class="row my-3">
                  <div class="col-12">
                    <ul class="list-group">
                      <li class="list-group-item">
                        <div class="row">
                          <div class="col-md-6">Total Pembayaran</div>
                          <div class="col-md-1">:</div>
                          <div v-for="biaya in biaya" v-bind:key="biaya.id" class="col-md-5">Rp. {{ biaya.biaya }}</div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6" id="invoice-payment">
            <div>
              <p class="h4 font-weight-bold text-center">Klink Citra Medika</p>
              <hr>
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
              <div v-for="obat in obat" v-bind:key="obat.id">
                <div class="row my-3">
                  <div class="col-2">
                    <span>R /</span>
                  </div>
                  <div class="col-1">:</div>
                  <div class="col-9">
                    <span class="my-3">{{ obat.nama_obat }}, {{ obat.jumlah }}</span><br>
                    <span> {{ obat.signa }} </span>
                  </div>
                </div>
              </div>
              <div v-for="racikan in tampil_racikan" v-bind:key="racikan.id">
                <div class="row my-3">
                  <div class="col-2">
                    <span>R /</span>
                  </div>
                  <div class="col-1">:</div>
                  <div class="col-9">
                    <div v-for="rac_obat in racikan.obat" v-bind:key="rac_obat.id">
                      <span class="my-3">{{ rac_obat.nama_obat }}, {{ rac_obat.jumlah }}</span><br>
                    </div>
                    <span>{{ racikan.pulv }}, {{ racikan.signa }}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row my-3">
        <div class="col col-lg-4">
        </div>
        <div class="col col-lg-2">
          <!-- <button type="button" @click="SimpanDenganResep()" class="btn btn-success btn-block float-right">Tambah Resep</button> -->
        </div>
        <div class="col col-lg-3">
          <button type="button" class="btn btn-primary float-right" onclick="window.print();">Cetak invoice</button>
        </div>
        <div class="col col-lg-3">
            <button v-if="proses == false" type="button" class="btn btn-info float-right" @click="Selesai()">Selesai</button>
            <button class="btn btn-info float-right" type="button" disabled="" v-else>
              <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
             Loading...
            </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
/*eslint-disable*/
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'
import axios from "axios"

  export default {
    name: 'invoice',
    components: {
      SidebarNav
    },
    data() {
      return {
        pasien_rekmed: [],
        subjektif: [],
        objektif: {},
        assesment: [],
        plan_diagnosis: [],
        plan_terapi: [],
        plan_edukasi: [],
        tampil_racikan: [],
        racikan_obat: [],
        obat: [],
        diagnosis: [],
        tindakan: [],
        biaya: [],
        kosong: [],
        proses : false
        
      }
    },
    async created() {
      //localStorage.clear();
      const getData = (x) => {
        let y = localStorage.getItem(x);
        return JSON.parse(y) || [];
      }
      this.pasien_rekmed = getData('pasien');
      this.subjektif = getData('subjective');
      this.objektif = getData('objektive');
      this.assesment = getData('assesment');
      this.plan_diagnosis = getData('plan_diagnosis');
      this.plan_terapi = getData('plan_terapi');
      this.plan_edukasi = getData('plan_edukasi');
      this.tampil_racikan = getData('racikan');
      this.diagnosis = getData('diagnosis');
      this.tindakan = getData('tindakan');
      this.obat = getData('obat');
      this.biaya = getData('biaya');
    },
    methods : {
      //validasi kondisi id plan jika null maka melakukan request ke api
      //kemudian disimpan ke dalam variabel id plan
      async Selesai() {
        this.proses = true
        console.log('hahaha')

           //SUbjektif
          const sub = await axios.post('http://localhost/rekmed-server/Api/v1/Subjektif/post',{
           data : this.subjektif
          }).then(res => this.sub = res.data)

          const cari_sub = await axios.post('http://localhost/rekmed-server/Api/v1/Subjektif_terpilih/post', {
            data : this.subjektif
          }).then(res => this.cari_sub = res.data)
          
          //objektif
          const obj = await axios.post('http://localhost/rekmed-server/Api/v1/Objektif/post',
            this.objektif).then(res => this.obj = res.data)
          
          //assesmen
          const asses = await axios.post('http://localhost/rekmed-server/Api/v1/Assesment/post',{
            data : this.assesment
          }).then(res => this.asses = res.data)

          const cari_asses = await axios.post('http://localhost/rekmed-server/Api/v1/Assesment_terpilih/post',{
            data : this.assesment
          }).then(res => this.cari_asses = res.data)
          
          //plan diagnosis
          const plan_diag = await axios.post('http://localhost/rekmed-server/Api/v1/Plan/post/rencana_diagnostik',{
            data : this.plan_diagnosis
          }).then(res => this.plan_diag = res.data)

          const cari_plan_diag = await axios.post('http://localhost/rekmed-server/Api/v1/PlanDiag_terpilih/post',{
            data : this.plan_diagnosis
          }).then(res => this.cari_plan_diag = res.data)
          
          //plan terapi
          const plan_ter = await axios.post('http://localhost/rekmed-server/Api/v1/Plan/post/rencana_terapi',{
            data : this.plan_terapi
          }).then(res => this.plan_ter = res.data)

          const cari_plan_ter = await axios.post('http://localhost/rekmed-server/Api/v1/PlanTer_terpilih/post',{
            data : this.plan_terapi
          }).then(res => this.cari_plan_ter = res.data)
          
          //plan edukasi
          const plan_edu = await axios.post('http://localhost/rekmed-server/Api/v1/Plan/post/rencana_edukasi',{
            data  : this.plan_edukasi
          }).then(res => this.plan_edu = res.data)

          const cari_plan_edu = await axios.post('http://localhost/rekmed-server/Api/v1/PlanEdu_terpilih/post',{
            data : this.plan_edukasi
          }).then(res => this.cari_plan_edu = res.data)
          
          //diagnosis
          const diag = await axios.post('http://localhost/rekmed-server/Api/v1/Diagnosis/post',{
            data : this.diagnosis
          }).then(res => this.diag = res.data)
          
          //tindakan
          const tind = await axios.post('http://localhost/rekmed-server/Api/v1/Tindakan/post',{
            data : this.tindakan
          }).then(res => this.tind = res.data)

          const cari_tind = await axios.post('http://localhost/rekmed-server/Api/v1/Tindakan_terpilih/post',{
            data : this.tindakan
          }).then(res => this.cari_tind = res.data)
          
          //obat
          const temp_obat = await axios.post('http://localhost/rekmed-server/Api/v1/Obat/post',{
            data : this.obat
          }).then(res => this.temp_obat = res.data)
        //await this.tambah()

        /*this.subjektif = [...this.kosong]
        this.objektif = [...this.kosong]
        this.assesment = [...this.kosong]
        this.plan_diagnosis = [...this.kosong]
        this.plan_terapi = [...this.kosong]
        this.plan_edukasi = [...this.kosong]
        this.tampil_racikan = [...this.kosong]
        this.diagnosis = [...this.kosong]
        this.tindakan = [...this.kosong]
        this.obat = [...this.kosong]
        this.biaya = [...this.kosong]
        this.pasien_rekmed = [...this.kosong]


        localStorage.setItem('subjective', JSON.stringify(this.subjektif));
        localStorage.setItem('objektive', JSON.stringify(this.objektif));
        localStorage.setItem('assesment', JSON.stringify(this.assesment));
        localStorage.setItem('plan_diagnosis', JSON.stringify(this.plan_diagnosis));
        localStorage.setItem('plan_terapi', JSON.stringify(this.plan_terapi));
        localStorage.setItem('plan_edukasi', JSON.stringify(this.plan_edukasi));
        localStorage.setItem('racikan', JSON.stringify(this.tampil_racikan));
        localStorage.setItem('diagnosis', JSON.stringify(this.diagnosis));
        localStorage.setItem('tindakan', JSON.stringify(this.tindakan));
        localStorage.setItem('obat', JSON.stringify(this.obat));
        localStorage.setItem('biaya', JSON.stringify(this.biaya));
        localStorage.setItem('pasien', JSON.stringify(this.pasien_rekmed));*/

        this.$router.push('/');

      }
    }
  }

</script>
<style>
@media print {
    body * {
      visibility: hidden;
    }
    #invoice-payment, #invoice-payment * {
      visibility: visible;
    }
    #invoice-payment {
      /* position: absolute; */
      right: 300px;
      top: 270px;
      transform: scale(1.9);
      /* zoom: 100%; */
    }
  }
</style>