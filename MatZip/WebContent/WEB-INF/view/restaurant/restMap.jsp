<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="sectionContainerCenter">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91a1adc940bfd01e9782c38f5c083003"></script>
	<div id="mapContainer" style="width:100%;height:100%;"></div>
	<script>
		const options = {
			center: new kakao.maps.LatLng(35.865523, 128.593381),
			level: 5 	//지도 확대,축소(값이 적을수록 더 확대)
		};

		const map = new kakao.maps.Map(mapContainer, options);
	</script>
</div>