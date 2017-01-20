using NUnit.Framework;
using Server.SDK;
using System;
namespace Server.SDK.Tests
{
	[TestFixture()]
	public class Test
	{
		[Test()]
		public void TestCase()
		{
			var server = new ServerCode();
			Assert.AreSame("Server code.", server.getSharedCode().CustomClassName);
		}
	}
}
