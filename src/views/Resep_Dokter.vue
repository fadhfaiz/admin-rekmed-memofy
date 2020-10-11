<!-- eslint-disable -->
<template>
  <div class="resep_dokter">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">
      <!-- Infodata -->
      <!-- <InfoData /> -->
      <h3>ID Pasien : {{ pasien_rekmed.ID }}  </h3>
      <h3>Nama Pasien : {{ pasien_rekmed.nama}}</h3>
      <br>
      <h2 class="my-3 font-weight-bold">Form Resep Dokter</h2>
      <div class="card">
        <!-- <div class="card-header plan-card-kotak btn btn-link plan-hover-atas" id="headingEmpat" data-toggle="collapse" data-target="#collapseEmpat" aria-expanded="true" aria-controls="collapseEmpat">
         <h5 class="mb-0 text-left">Resep Dokter</h5>
        </div> -->
        <!-- <div id="collapseEmpat" class="collapse" aria-labelledby="headingEmpat" data-parent="#accordion"> -->
          <div class="card-body plan-card-kotak">
            <div class="row">
              <div class="col-md-12 mb-3">
                <div class="card">
                  <div class="card-header font-weight-bold bg-dark text-white">
                    Daftar Resep Dokter
                  </div>
                  <div class="card-body">
                    <div class="form-inline mb-4">
                      <input type="text" th scope="col" style="width: 17rem;" class="form-control mr-1" placeholder="Cari / tambah diagnosis">
                      <button type="submit" class="btn btn-block btn-success">Tambah <i class="fa fa-plus-circle"></i></button>
                    </div>
                   <div class="plan_form kiri">
                      <table class="table table-hover table-bordered">
                        <thead>
                          <tr class="text-center bg-dark" style="color: white;">
                           <th scope="col">ID</th>
                           <th scope="col" style="width: 20rem;">Diagnosis</th>
                           <th scope="col">Proses</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th scope="row" class="text-center">P0</th>
                              <td class="text-center"></td>
                              <td class="text-center">
                                <button class="btn btn-info btn-sm mr-2" type="button" data-toggle="modal" data-target="#proses_antrian"><i style="float: left;" class="fa fa-arrow-right"></i></button>
                              </td>
                          </tr>
                        </tbody>
                      </table>
                  </div>
                  </div>
                </div>
              </div>
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header font-weight-bold bg-dark text-white">Rekap Resep</div>
                    <div class="card-body plan_form kanan">
                      <div class="card" style="width: 26rem;">
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item">Demam<span><button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;" class="fa fa-times"></i></button></span></li>
                          <li class="list-group-item">Stress<span><button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;" class="fa fa-times"></i></button></span></li>
                          <li class="list-group-item">Batuk tak berdahak<span><button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;" class="fa fa-times"></i></button></span></li>
                          <li class="list-group-item">Galau sepanjang hari<span><button class="btn btn-danger btn-sm float-right" type="button" data-toggle="modal" data-target="#hapus_subjektif"><i style="float: left;" class="fa fa-times"></i></button></span>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
          </div>
        <!-- </div> -->
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
  name: 'resep_dokter',
  components: {
    SidebarNav,
  },
  data() {
    return {
      pasien_rekmed : [],
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

  }
}

</script>
<style>
  .plan_form {
    overflow-y: scroll;
  }

  /* .assesment_terpilih::-webkit-scrollbar {
  display: none;
} */

  .kanan {
    height: 399px;
  }

  .kiri {
    height: 299px;
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

  .plan-hover-atas {
    background-image: -webkit-linear-gradient(left,#056644,#05AC72,#0AD48B);
    /* background-color: #13EBA2; */
    border-radius: 0.35rem !important;
    color: #fff !important;
    border-right: 0px !important;
    border-left: 0px !important;
    padding-top: 0.75rem !important;
    padding-bottom: 0.75rem !important;
  }

  .plan-hover-atas:hover {
    background-color: #15c73c;
  }

  .card {
    /* border: 0px !important; */
    margin-bottom: 0.5rem !important;
    border-radius: 0.35rem !important;
  }
</style>
