<template>
  <div class="plan">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">

      <!-- Infodata -->
      <!-- <InfoData /> -->

      <h2 class="my-3 font-weight-bold">Form Plan</h2>

      <small class="text-danger font-weight-bold mb-3">* Klik panel lain untuk membuka form tersebut.</small>

      <div>
        <div id="accordion">
          <div class="card plan-card-kotak">
            <div class="card-header plan-card-kotak btn btn-link plan-hover-atas" id="headingSatu" data-toggle="collapse" data-target="#collapseSatu" aria-expanded="false" aria-controls="collapseSatu">
              <h5 class="mb-0 text-left">
                  Rencana Diagnostik (D)
              </h5>
            </div>
            <div id="collapseSatu" class="collapse show" aria-labelledby="headingSatu" data-parent="#accordion">
              <div class="card-body plan-card-kotak">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
              </div>
            </div>
          </div>
          <div class="card plan-card-kotak">
            <div class="card-header plan-card-kotak btn btn-link plan-hover-atas" id="headingDua" data-toggle="collapse" data-target="#collapseDua" aria-expanded="false" aria-controls="collapseDua">
              <h5 class="mb-0 text-left">
                  Rencana Terapi / Tindakan (Tx)
              </h5>
            </div>
            <div id="collapseDua" class="collapse" aria-labelledby="headingDua" data-parent="#accordion">
              <div class="card-body plan-card-kotak">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
              </div>
            </div>
          </div>
          <div class="card plan-card-kotak">
            <div class="card-header plan-card-kotak btn btn-link plan-hover-atas" id="headingTiga" data-toggle="collapse" data-target="#collapseTiga" aria-expanded="true" aria-controls="collapseTiga">
              <h5 class="mb-0 text-left">
                  Rencana Edukasi (E)
              </h5>
            </div>
            <div id="collapseTiga" class="collapse" aria-labelledby="headingTiga" data-parent="#accordion">
              <div class="card-body plan-card-kotak">
                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
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
  name: 'plan',
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

.plan-card-kotak {
  border-radius: 0px;
}

a {
  text-decoration: none;
}

.plan-hover-atas {
  background-color: #28a745;
  border-radius: 0px !important;
  color: #fff !important;
}
.plan-hover-atas:hover {
  background-color: #15c73c;
}
</style>
