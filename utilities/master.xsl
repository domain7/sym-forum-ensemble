<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="../utilities/date-time.xsl"/>
<xsl:include href="../utilities/typography.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:variable name="member" select="/data/events/member-login-info"/>
<xsl:variable name="logged-in" select="/data/events/member-login-info/@logged-in"/>
<xsl:variable name="permissions" select="data/events/member-login-info/permissions/forum"/>

<xsl:template match="/">
	<html>
		<head>
			<xsl:apply-templates select="data" mode="page-title"/>
			<!-- link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/assets/css/styles.css" /-->
			<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/assets/css/layout.css" />
			<link rel="stylesheet" type="text/css" media="screen" href="{$workspace}/assets/css/themes/dark/dark.css" />
			<script type="text/javascript" src="{$workspace}/assets/js/jquery/jquery-1.3.2.min.js"></script>
			<script type="text/javascript" src="{$workspace}/assets/js/system.js"></script>
			<script type="text/javascript" src="{$workspace}/assets/js/syntax-xml.js"></script>
		</head>
		<body>
			<div id="masthead">
				<div>
					<h1><a href="{$root}"><xsl:value-of select="$website-name"/></a></h1>
					<xsl:call-template name="login-panel"/>
				</div>
			</div>
			<div id="package">
				<div id="sidebar">
					<xsl:apply-templates select="data" mode="side-panel"/>
					<xsl:call-template name="whos-online"/>
				</div>
				<div id="content">
					<xsl:apply-templates/>
				</div>
			</div>
			<xsl:call-template name="footer"/>
			<script type="text/javascript" src="{$workspace}/assets/js/wmd/wmd.js"></script>
		</body>
	</html>
</xsl:template>

<xsl:template match="data" mode="page-title">
	<title><xsl:value-of select="$website-name"/></title>
</xsl:template>

<xsl:template match="data" mode="side-panel"/>

<xsl:template name="footer">
		<ul id="footer">
			<li>Powered by <a href="http://symphony-cms.com">Symphony</a></li>
		</ul>
</xsl:template>

<xsl:template name="login-panel">
	<form id="login-panel" action="{$current-url}" method="post">
		<fieldset>
			<ul>
				<xsl:choose>
					<xsl:when test="/data/events/member-login-info/role = 'Inactive'">
						<li>Account is not active.</li>
						<li><a class="button" href="{$root}/members/activate/">Activate</a></li>
						<li> or </li>
						<li><a class="button" href="?member-action=logout">Logout</a></li>
					</xsl:when>
					<xsl:when test="/data/events/member-login-info/@logged-in = 'true'">
						<li>
							<a href="{$root}/members/{/data/events/member-login-info/username-and-password/@username}/">
								<xsl:text>Hello, </xsl:text>
								<xsl:value-of select="/data/events/member-login-info/username-and-password/@username"/>
							</a>
						</li>
						<li>
							<a class="button" href="?member-action=logout">Logout</a>
						</li>
					</xsl:when>
					<xsl:when test="/data/events/member-login-info/@failed-login-attempt = 'true'">
						<li>Login Failed, </li>
						<li><input id="submit" type="submit" name="reset" value="Try Again" class="button"/></li>
						<li> or </li>
						<li><a class="button" href="{$root}/members/reset-pass/">Reset Password</a></li>
					</xsl:when>
					<xsl:otherwise>
						<li><input name="username" title="username" type="text" value="username" class="clear-on-focus"/></li>
						<li><input name="password" title="chipmonk" type="password" value="chipmonk" class="clear-on-focus"/></li>
						<li><input name="redirect" type="hidden" value="{$root}/"/><input id="submit" type="submit" name="member-action[login]" value="Log In" class="button"/></li>
						<li class="register"><span>or </span><a href="{$root}/members/new/" class="register button">Register an Account</a></li>
					</xsl:otherwise>
				</xsl:choose>
			</ul>
		</fieldset>
	</form>
</xsl:template>

<xsl:template name="whos-online">
	<div id="whos-online">
		<h3><xsl:value-of select="concat('Currently Online (', count(data/whos-online/member), ')')"/></h3>
		<ul>
			<xsl:for-each select="data/whos-online/member">
				<li>
					<a href="{$root}/members/{.}">
						<img src="http://www.gravatar.com/avatar/{@email-hash}?s=25&amp;d=http%3A%2F%2Fsymphony-cms.com%2Fworkspace%2Fassets%2Fimages%2Ficons%2Fsymphony-avatar.png" width="25" height="25" />
						<xsl:value-of select="concat(' ',.)"/>
					</a>
				</li>						
			</xsl:for-each>
		</ul>
	</div>
</xsl:template>

</xsl:stylesheet>