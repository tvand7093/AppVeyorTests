using System;
using Shared.SDK;

namespace Client.SDK
{
	public class ClientCode
	{
		public SharedCode getSharedCode()
		{
			return new SharedCode() { CustomClassName = "Client Based Setup" };
		}
	}
}
