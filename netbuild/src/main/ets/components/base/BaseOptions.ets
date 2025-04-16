import { HashMap } from "@kit.ArkTS"

export default class BaseOptions {
  baseUrl: string = ""
  headerMap?: HashMap<string, string> = new HashMap()
}