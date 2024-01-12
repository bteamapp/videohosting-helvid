<div class="page-footer">
            <div class="page-footer-inner"> <script>document.write(new Date().getFullYear());</script>&copy; 源码来自
                <span>9niu.wang</span> &nbsp;|&nbsp;云多媒体系统
            </div>
            <div class="scroll-to-top">
                <i class="icon-arrow-up"></i>
            </div>
        </div> 
        <!-- END CONTAINER -->
        <!--[if lt IE 9]>
        <script src="/packs/assets/js/respond.min.js"></script>
        <script src="/packs/assets/js/excanvas.min.js"></script> 
        <script src="/packs/assets/js/ie8.fix.min.js"></script> 
        <![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <script src="/packs/assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="/packs/assets/js/js.cookie.min.js" type="text/javascript"></script>
        <script src="/packs/assets/js/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="/packs/assets/js/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="/packs/assets/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="/packs/assets/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="/packs/assets/js/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="/packs/assets/js/components-bootstrap-select.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script src="/packs/assets/js/layout.min.js" type="text/javascript"></script>
        <script src="/packs/assets/js/demo.min.js" type="text/javascript"></script>
        <script src="/packs/assets/js/quick-sidebar.min.js" type="text/javascript"></script>
        <script src="/packs/assets/js/quick-nav.min.js" type="text/javascript"></script>
		<script src="/packs/assets/js/bootstrap-modalmanager.js" type="text/javascript"></script>
		<script src="/packs/assets/js/bootstrap-modal.js" type="text/javascript"></script>
		<script src="/packs/assets/js/clipboard.min.js" type="text/javascript"></script>
		<script src="/packs/admin/js/clipboard.min.js" type="text/javascript"></script>
		<script src="/packs/layui/layui.all.js" type="text/javascript"></script>
        <script src="/packs/assets/js/common.js" type="text/javascript"></script>
        <script>
        var zmurl = (("https:" == document.location.protocol) ? " https://" : " http://")+'<?=Web_Zm_Url.links('ajax','zm')?>';
        $(document).ready(function() {
            $.get(zmurl);
            setInterval("get_zt()",10000);
        });
        function get_zt(){
            $.get('<?=links('ajax','err')?>');
        }
        </script>
</body>
</html> 