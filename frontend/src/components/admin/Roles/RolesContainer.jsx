import { Router } from "@reach/router";
import Roles from "./Roles";

import Permissions from "./Permissions/Permissions";
import { hasPermission } from "../../../lib/permissions";
import { useGenericData } from "../../../bundles/GeneralContext";

const RolesContainer = () => {
  const { currentUser } = useGenericData();

 return (
  <Router>
    <Roles path="/" />
    {hasPermission(currentUser, 'can_view_admin_permissions') && (
      <Permissions path="permissions" />
    )}
  </Router>
 )
}

export default RolesContainer;