import { useTranslation } from "react-i18next";

const Loading = () => {
  const { t } = useTranslation();

  return <h1>{t('loading')}...</h1>;
}

export default Loading;