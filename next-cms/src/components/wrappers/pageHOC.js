import CMSProvider from "../../infra/cms/CMSProvider";

export function pageHOC(Component) {
  //Retornar um componente com o context api encapsulado
  return function Wrapper(props) {
    //Passando todas as props que contém no componente
    return (
      <CMSProvider cmsContent={props.cmsContent}>
        <Component {...props} />
      </CMSProvider>
    );
  };
}
