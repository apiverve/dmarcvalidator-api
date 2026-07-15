declare module '@apiverve/dmarcvalidator' {
  export interface dmarcvalidatorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface dmarcvalidatorResponse {
    status: string;
    error: string | null;
    data: DMARCValidatorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface DMARCValidatorData {
      host:        null | string;
      dmarcHost:   null | string;
      hasDmarc:    boolean | null;
      dmarcRecord: null | string;
      rua:         Rua;
      ruf:         Rua;
      v:           null | string;
      p:           null | string;
      valid:       boolean | null;
      isEnforced:  boolean | null;
      riskScore:   number | null;
      riskLevel:   null | string;
  }
  
  interface Rua {
      email:  null | string;
      domain: null | string;
      valid:  boolean | null;
  }

  export default class dmarcvalidatorWrapper {
    constructor(options: dmarcvalidatorOptions);

    execute(callback: (error: any, data: dmarcvalidatorResponse | null) => void): Promise<dmarcvalidatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: dmarcvalidatorResponse | null) => void): Promise<dmarcvalidatorResponse>;
    execute(query?: Record<string, any>): Promise<dmarcvalidatorResponse>;
  }
}
