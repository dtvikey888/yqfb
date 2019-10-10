package org.filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
/**
 * 处理乱码
 * @说明
 * @author cuisuqiang
 * @version 1.0
 * @since
 */
public class EncodingFilter implements Filter {
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response,
						 FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("gbk");
		response.setCharacterEncoding("gbk");
		chain.doFilter(request, response);
	}
	public void init(FilterConfig arg0) throws ServletException {

	}
}