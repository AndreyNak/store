import { Routes, Route } from "react-router-dom";
import Roles from "./Roles";

import Permissions from "./Permissions/Permissions";
import { hasPermission } from "../../../lib/permissions";
import { useGenericData } from "../../../bundles/GeneralContext";

const RolesContainer = () => {
  const { currentUser } = useGenericData();

 return (
  <Routes>
    <Route path="/" element={<Roles/>} />
    {hasPermission(currentUser, 'can_view_admin_permissions') && (
      <Route path="permissions" element={<Permissions/>} />
    )}
  </Routes>
 )
}

export default RolesContainer;