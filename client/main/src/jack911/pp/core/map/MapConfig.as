package jack911.pp.core.map
{
	import flash.geom.Point;
	import flash.utils.ByteArray;
	
	import jack911.pp.core.map.events.MapConfigEvent;
	import jack911.pp.core.map.events.MapMonitor;
	import jack911.pp.core.map.material.AStarNode;
	import jack911.pp.core.map.material.AroundTraver;

	public class MapConfig
	{
		private var META_DONE:Boolean = false;
		/** 来自metadata的数据接收完毕 */
		public function metaDone():void
		{
			META_DONE = true;
			checkFullDone();
		}
		private var CFG_DONE:Boolean = false;
		/** 来自.map的数据接收完毕 */
		public function cfgDone():void
		{
			CFG_DONE = true;
			checkFullDone();
		}
		/** 检查是否MapConfig被完整部署了 */
		private function checkFullDone():void
		{
			if(META_DONE && CFG_DONE)
			{
				MapConfigEvent.dispatchMapConfigFullDone(this);
			}
		}
		
		private var mapName:String = "";
		public function setMapName(name:String):void
		{
			mapName = name;
		}
		public function getMapName():String { return mapName; }
		
		private var mapId:int = 0;
		public function setMapId(id:*):void
		{
			mapId = int(id);
		}
		public function getMapId():int { return mapId; }
		
		private var mapWidth:int = 0;
		public function setMapWidth(w:int):void
		{
			mapWidth = w;
		}
		public function getMapWidth():int { return mapWidth; }
		
		private var mapHeight:int = 0;
		public function setMapHeight(h:int):void
		{
			mapHeight = h;
		}
		public function getMapHeight():int { return mapHeight; }
		
		private var tileWidth:int = 0;
		public function setTileWidth(w:int):void
		{
			tileWidth = w;
		}
		public function getTileWidth():int { return tileWidth; }
		
		private var tileHeight:int = 0;
		public function setTileHeight(h:int):void
		{
			tileHeight = h;
		}
		public function getTileHeight():int { return tileHeight; }
		
		private var tileCol:int = 0;
		public function setTileCol(c:int):void
		{
			tileCol = c;
		}
		public function getTileCol():int { return tileCol; }
		
		private var tileRow:int = 0;
		public function setTileRow(r:int):void
		{
			tileRow = r;
		}
		public function getTileRow():int { return tileRow; }
			
		public function MapConfig()
		{
		}
		
		private function install():void
		{
		}
		
		private function uninstall():void
		{
		}
		
		public function decodeMeta(obj:Object):void
		{
			var cfg:Object;
			if(obj is String)
			{
				cfg = new Object();
				var items:Array = String(obj).split("\r\n");
				for(var i:int = 0; i < items.length; i++)
				{
					var item:String = items[i];
					var key:String = item.split("=")[0];
					var value:String = item.split("=")[1];
					cfg[key] = value;
				}
			}
			else
			{
				cfg = obj;
			}
			setMapId(cfg["map_id"]);
			setMapName(cfg["map_name"]);
			//setGridW(cfg["grid_w"]);
			//setGridH(cfg["grid_h"]);
			setMapWidth(cfg["map_w"]);
			setMapHeight(cfg["map_h"]);
			setTileWidth(cfg["tile_w"]);
			setTileHeight(cfg["tile_h"]);
			setTileCol(cfg["tile_col"]);
			setTileRow(cfg["tile_row"]);
		}
		
		public function decodeCfg(bytes:ByteArray):Boolean
		{
			return true;
		}
		
		public function toString():String
		{
			return "[MapConfig] id=" + mapId + " name=" + mapName;
		}
		
	}
}