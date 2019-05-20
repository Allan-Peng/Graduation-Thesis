<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

 <ul id="Nav" class="layui-nav layui-nav-tree">
					
 		            <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>系统用户管理</em>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="allusers_add.jsp">管理员添加</a></dd>
                            <dd><a href="allusersList.do">管理员管理</a></dd>
                            <dd><a href="yonghuzhuceList.do">注册用户管理</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>文章管理</em>
                        </a>
                        <dl class="layui-nav-child">
                                <dd><a href="xinwentongzhi_add.jsp?lb=评测类文章">评测类文章添加</a></dd>
                                <dd><a href="xinwentongzhiList.do?lb=评测类文章">评测类文章查询</a></dd>
                                <dd><a href="xinwentongzhi_add.jsp?lb=曝光类文章">曝光类文章添加</a></dd>
							    <dd><a href="xinwentongzhiList.do?lb=曝光类文章">曝光类文章查询</a></dd>
                                <dd><a href="xinwentongzhi_add.jsp?lb=预测类文章">预测类文章添加</a></dd>
								<dd><a href="xinwentongzhiList.do?lb=预测类文章">预测类文章查询</a></dd>
						    </dl>
                    </li>
					
					<li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>手机新闻管理</em>
                        </a>
                        <dl class="layui-nav-child">
                                <dd><a href="xinwentongzhi_add.jsp?lb=娱乐新闻">娱乐新闻添加</a></dd>
							    <dd><a href="xinwentongzhiList.do?lb=娱乐新闻">娱乐新闻查询</a></dd>
                                <dd><a href="xinwentongzhi_add.jsp?lb=科技新闻">科技新闻添加</a></dd>
							    <dd><a href="xinwentongzhiList.do?lb=科技新闻">科技新闻查询</a></dd>
							</dl>
                    </li>
					
					<li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>所有评论管理</em>
                        </a>
                        <dl class="layui-nav-child">
                                <dd><a href="pinglunList.do">所有评论管理</a></dd>
                            </dl>
                    </li>
					<li class="layui-nav-item">
                        <a href="javascript:;">
                            <i class="layui-icon">&#xe857;</i>
                            <em>系统基本管理</em>
                        </a>
                        <dl class="layui-nav-child">
                               
                                <dd><a href="youqinglianjie_add.jsp">友情连接添加</a></dd>
								<dd><a href="youqinglianjieList.do">友情连接查询</a></dd>
							</dl>
                    </li>

                </ul>