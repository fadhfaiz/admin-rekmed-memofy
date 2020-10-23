<!-- eslint-disable -->
<template>
  <div class="tag">
    <!-- Sidebar -->
    <SidebarNav />

    <!-- Page Content -->
    <div id="content">
      <!-- <div class="field">
                        <div class="control">
                            <label class="checkbox">
                                <input type="checkbox" v-model="typeahead"> Typeahead/autocomplete on
                            </label>
                        </div>
                    </div>

                    <div v-show="typeahead" class="field">
                        <div class="control">
                            <label class="checkbox">
                                <input type="checkbox" v-model="typeheadAlwaysShow">
                                Always show Typeahead
                            </label>
                        </div>
                    </div>

                    <div v-show="typeahead" class="field">
                        <div class="control">
                            <label class="checkbox">
                                <input type="checkbox" v-model="typeaheadShowOnFocus">
                                Show Typeahead on focus
                            </label>
                        </div>
                    </div>

                    <div v-show="typeahead" class="field">
                        <div class="control">
                            <label class="checkbox">
                            <input type="checkbox" v-model="typeaheadHideDiscard">
                            Hide 'Discard Search Results' button
                            </label>
                        </div>
                    </div>

                    <div v-show="typeahead" style="margin-bottom: 1rem;">
                        <div class="field">
                            <label class="label">Typeahead Style</label>
                        
                            <div class="control">
                                <select class="input" type="text" v-model="typeaheadStyle">
                                    <option value="badges">Badges</option>
                                    <option value="dropdown">Dropdown</option>
                                </select>
                            </div>
                        </div>

                        <div class="field">
                            <label class="label">Typeahead Max Results</label>
                        
                            <div class="control">
                                <input class="input" type="text" v-model="typeaheadMaxResults">
                            </div>
                        </div>

                        <div class="field">
                            <label class="label">Typeahead Activation Threshold</label>
                        
                            <div class="control">
                                <input class="input" type="text" v-model="typeaheadActivationThreshold">
                            </div>
                        </div>
                    </div> -->
      <div class="card my-3">
        <div class="row p-4">
          <div class="col">
            <voerro-tags-input
                        v-model="selectedTags"
                        element-id="tags"
                        :existing-tags="[
                            { key: 'children-of-bodom', value: 'Children of Bodom' },
                            { key: 'epica', value: 'Epica' },
                            { key: 'emperor', value: 'Emperor' },
                            { key: 'shape-of-despair', value: 'Shape of Despair' },
                            { key: 'protest-the-hero', value: 'Protest the Hero' },
                            { key: 'my-dying-bride', value: 'My Dying Bride' },
                            { key: 'ne-obliviscaris', value: 'Ne Obliviscaris' },
                            { key: 'belakor', value: 'Be\'lakor' },
                            { key: 'dark-lunacy', value: 'Dark Lunacy' },
                            { key: 'dominia', value: 'Dominia' },
                            { key: 'jason-becker', value: 'Jason Becker' },
                            { key: 'jeff-loomis', value: 'Jeff Loomis' },
                            { key: 'persefone', value: 'Persefone' },
                        ]"
                        :typeahead="true"
                        :typeahead-style="dropdown"
                        :typeahead-show-on-focus="true"
                    ></voerro-tags-input>
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
  import VoerroTagsInput from '@voerro/vue-tagsinput'
  //import InfoData from '@/components/InfoData.vue'

  export default {
    name: 'tag',
    components: {
      SidebarNav,
      VoerroTagsInput
    },
    data() {
      return {
      selectedTags: [],
                typeahead: true,
                typeaheadStyle: 'dropdown',
                typeaheadShowOnFocus: true,
      }
    },

            methods: {
            
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
