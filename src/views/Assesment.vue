<template>
  <div class="assesment">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->

      <h2 class="my-3 font-weight-bold">Form Assesment</h2>
      <div class="row">
        <div class="col-md-6">
          <div class="card">
            <div class="card-header font-weight-bold">
              Daftar Diagnosis
            </div>
            <div class="card-body">
              <div class="form-inline mb-4">
                <input type="text" th scope="col" style="width: 18rem;" class="form-control mr-1" id="cari_data_pasien" placeholder="Cari / tambah diagnosis" v-model="keluhan_pasien">
                <router-link to="/pendaftaran"><button type="submit" class="btn btn-block btn-success">Tambah data <i
                      class="fa fa-plus-circle"></i></button></router-link>
              </div>
              <div class="assesment_terpilih kiri">
              <table v-if="keluhan_pasien != ''" class="table table-hover table-bordered">
                <thead>
                  <tr class="text-center bg-dark" style="color: white;">
                    <th scope="col">ID</th>
                    <th scope="col" style="width: 20rem;">Diagnosis</th>
                    <th scope="col">Proses</th>
                  </tr>
                </thead>
                <tbody>
                  <tr v-for="(row, index) in pasien" :key="index">
                    <th scope="row" class="text-center">P0{{ index+1 }}</th>
                    <td class="text-center">{{ row.Rekam_Medis }}</td>
                    <td class="text-center">
                      <button class="btn btn-info btn-sm mr-2" type="button" data-toggle="modal"
                        data-target="#proses_antrian"><i style="float: left;" class="fa fa-arrow-right"></i></button>
                    </td>
                  </tr>
                </tbody>
              </table>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="card">
            <div class="card-header font-weight-bold">
              Assesment Terpilih
            </div>
            <div class="card-body assesment_terpilih kanan">
              <div class="card" style="width: 29rem;">
                <ul class="list-group list-group-flush">
                  <li class="list-group-item">Demam<span><button class="btn btn-danger btn-sm float-right" type="button"
                        data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;"
                          class="fa fa-times"></i></button></span></li>
                  <li class="list-group-item">Stress<span><button class="btn btn-danger btn-sm float-right"
                        type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;"
                          class="fa fa-times"></i></button></span></li>
                  <li class="list-group-item">Batuk tak berdahak<span><button class="btn btn-danger btn-sm float-right"
                        type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;"
                          class="fa fa-times"></i></button></span></li>
                  <li class="list-group-item">Galau sepanjang hari<span><button
                        class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal"
                        data-target="#hapus_subjektif"><i style="float: left;" class="fa fa-times"></i></button></span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import SidebarNav from '@/components/SidebarNav.vue'

export default {
  name: 'assesment',
  components: {
    SidebarNav
  },
  data () {
    return {
      pasien: [
        { Rekam_Medis: 201801 },
        { Rekam_Medis: 201802 },
        { Rekam_Medis: 201803 },
        { Rekam_Medis: 201804 },
        { Rekam_Medis: 201805 },
        { Rekam_Medis: 201806 }
      ],
      keluhan_pasien: ''
    }
  }
}

</script>

<style>
.assesment_terpilih {
  overflow-y: scroll;
}

/* .assesment_terpilih::-webkit-scrollbar {
  display: none;
} */

.kanan {
height: 400px;
}

.kiri {
height: 299px;
}

</style>
