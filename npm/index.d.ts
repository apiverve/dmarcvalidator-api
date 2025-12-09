declare module '@apiverve/dmarcvalidator' {
  export interface dmarcvalidatorOptions {
    api_key: string;
    secure?: boolean;
  }

  export interface dmarcvalidatorResponse {
    status: string;
    error: string | null;
    data: DMARCValidatorData;
    code?: number;
  }


  interface DMARCValidatorData {
      dmarcHost:   string;
      dmarcRecord: string;
      hasDmarc:    boolean;
      host:        string;
      p:           string;
      rua:         Rua;
      ruf:         Rua;
      v:           string;
      valid:       boolean;
  }
  
  interface Rua {
      domain: string;
      email:  string;
      valid:  boolean;
  }

  export default class dmarcvalidatorWrapper {
    constructor(options: dmarcvalidatorOptions);

    execute(callback: (error: any, data: dmarcvalidatorResponse | null) => void): Promise<dmarcvalidatorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: dmarcvalidatorResponse | null) => void): Promise<dmarcvalidatorResponse>;
    execute(query?: Record<string, any>): Promise<dmarcvalidatorResponse>;
  }
}
