import { http } from "@kit.NetworkKit";

// 拦截器接口
export interface HttpInterceptor {
  intercept: (options: http.HttpRequestOptions) => http.HttpRequestOptions
}