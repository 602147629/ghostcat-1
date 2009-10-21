package ghostcat.operation
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * 此类增加超时失败功能
	 * 
	 * @author flashyiyi
	 * 
	 */
	public class DelayOper extends Oper
	{
		public function DelayOper(timeout:int = 0)
		{
			this.timeout = timeout;
		}
		/**
		 * 延时时间，毫秒为单位，负数为永久等待
		 */
		public var timeout:int = 0;
		
		private var timer:Timer;
		
		public override function execute() : void
		{
			super.execute();
			
			if (timeout < 0)
				return;
			
			timer = new Timer(timeout,1)
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,result);
			timer.start();
		}
		
		public override function result(event:*=null):void
		{
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,result);
			timer.stop();
			
			super.result(event);
		}
		
		public override function fault(event:*=null):void
		{
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE,result);
			timer.stop();
			
			super.fault(event);
		}
	}
}