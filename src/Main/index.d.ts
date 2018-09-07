export as namespace Elm;

export interface App {
  ports: {
    hello: {
      subscribe(callback: (data: string) => void): void;
    };
    reply: {
      send(data: number): void;
    };
  };
}

export interface Flags {
  node: HTMLElement | null;
  flags: string;
}

export namespace Elm.Main {
  export function init(flags: Flags): App;
}
