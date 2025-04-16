export class BaseResponse {
  errorCode: number = -1;
  errorMsg: string | Resource = '';
  data: string | object = '';
}