using System;
using Shared.SDK;

namespace Server.SDK
{
	public class ServerCode
	{
		public SharedCode getSharedCode()
		{
			return new SharedCode() { CustomClassName = "Server code." };
		}
	}
}
