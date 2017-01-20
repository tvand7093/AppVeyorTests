using NUnit.Framework;
using System;
using Client.SDK;

namespace Client.SDK.Tests
{
	[TestFixture()]
	public class Test
	{
		[Test()]
		public void TestCase()
		{
			var client = new ClientCode();
			Assert.AreSame("Client Based Setup", client.getSharedCode().CustomClassName);
		}
	}
}
