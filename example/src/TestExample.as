package
{
	import flash.display.Sprite;
	import flash.text.Font;
	
	import ghostcat.manager.RootManager;
	import ghostcat.ui.containers.GAlert;
	
	[SWF(width="600",height="600")]
	public class TestExample extends Sprite
	{
		public function TestExample()
		{	
			RootManager.register(this);
			
			GAlert.show("测试文本测试文本测试文本测试文本\n测试文本测试文本测试文本","标题",["1","2"]);
		}
	}
}