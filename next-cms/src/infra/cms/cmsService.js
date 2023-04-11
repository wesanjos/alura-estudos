const TOKEN = process.env.DATO_TOKEN;

const globalQuery = `
query {
  globalFooter{
    description
  }
}
`;

const BASE_ENDPOINT = "https://graphql.datocms.com/";
const PREVIEW_ENDPOINT = "https://graphql.datocms.com/preview";

export async function cmsService({ query, variables, preview }) {
  const ENDPOINT = preview ? PREVIEW_ENDPOINT : BASE_ENDPOINT;

  try {
    const pageContentResponse = await fetch(ENDPOINT, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Bearer " + TOKEN,
      },
      body: JSON.stringify({
        query,
        variables,
      }),
    }).then(async (response) => {
      const body = await response.json();

      if (!body.errors) return body;

      throw new Error(JSON.stringify(body));
    });

    const globalContentResponse = await fetch(ENDPOINT, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        Authorization: "Bearer " + TOKEN,
      },
      body: JSON.stringify({
        query: globalQuery,
      }),
    }).then(async (response) => {
      const body = await response.json();

      if (!body.errors) return body;

      throw new Error(JSON.stringify(body));
    });

    return {
      data: {
        ...pageContentResponse.data,
        globalContent: {
          ...globalContentResponse.data,
        },
      },
    };
  } catch (error) {
    throw new Error(error.message);
  }
}
