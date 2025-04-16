export class BaseResponse<T> {
  errorCode: number = -1;
  errorMsg: string | Resource = '';
  data: string | Array<T> | Object = '';
}