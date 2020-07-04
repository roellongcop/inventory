<div class="modal inmodal fade" id="item-search" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">ITEM SEARCH</h4>
                <!-- <small class="font-bold">Item details.</small> -->
                <input 
                    type="text" 
                    list="list-searchbox" 
                    id="item-searchbox" 
                    class="form-control" 
                    placeholder="Scan to Search"
                    v-model="mdl_search">

                <datalist id="list-searchbox">
                    <option v-for="(item, index) in items" :value="item.serial"> 
                        {{ ' - ' + item.name}} 
                    </option>
                </datalist> 
            </div>
            <div class="modal-body">
                
            </div>
            <div class="modal-footer">
                <button type="button" data-dismiss="modal" class="btn btn-primary">Close</button>
            </div>
        </div>
    </div>
</div>